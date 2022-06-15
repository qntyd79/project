$(document).ready(function() {
    // 2020.02.05

	// 좌표설정
	proj4.defs("EPSG:5186", "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs");
	//proj4.defs("EPSG:5179","+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs");
	//proj4.defs("EPSG:4326","+proj=longlat +datum=WGS84 +no_defs");
	
    var proj5186 = ol.proj.get('EPSG:5186');    
    var format = 'image/png';
    var version = "1.3.0";
    var projection = new ol.proj.Projection({
        code : proj5186,
        units : 'm',
        axisOrientation : 'neu',
        global : false
    }); 

    // OSM 설정
    var OSM = new ol.layer.Tile({
    	visible: true,
    	source : new ol.source.OSM(),
    	zIndex : 1    	
    });
        
    // BingMaps 설정   
    var keyValue = 'AoTWblM8Bf48thwSrZ6Y4Bib9qkwA1ikfYBbcMadQdFNI-i1YI9ITnbc4Coz3_NO'
    var Road = new ol.layer.Tile({
    	visible: false,
        source: new ol.source.BingMaps({
            key: keyValue,
            imagerySet: 'Road' 
        }),
        zIndex : 2
    });   
    
    var RoadOnDemand = new ol.layer.Tile({
    	visible: false,
        source: new ol.source.BingMaps({
            key: keyValue,
            imagerySet: 'RoadOnDemand' 
        }),
        zIndex : 2
    });   
    
    var Aerial = new ol.layer.Tile({
    	visible: false,
        source: new ol.source.BingMaps({
            key: keyValue,
            imagerySet: 'Aerial' 
        }),
        zIndex : 2
    });   
    
    var AerialWithLabels = new ol.layer.Tile({
    	visible: false,
        source: new ol.source.BingMaps({
            key: keyValue,
            imagerySet: 'AerialWithLabels' 
        }),
        zIndex : 2
    });    
    
    // BingMaps Selectbox 설정
    var baseStyles = ['Road', 'RoadOnDemand', 'Aerial', 'AerialWithLabels'];
    var BingMap=[];
    for (var i = 0, ii = baseStyles.length; i < ii; ++i) {
    	BingMap.push(new ol.layer.Tile({
    		visible: false,
            preload: Infinity,
            source: new ol.source.BingMaps({
                key: keyValue,
                imagerySet : baseStyles[i]   
            }),
            zIndex : 2
        }));
    }
       
    var BingMapGroup = new ol.layer.Group({
    	visible: false,
        layers: BingMap
    });
    

    // VWORLD Base 설정 WMTS API 사용
    var url1 = 'http://api.vworld.kr/req/wmts/1.3.0/5638C501-9663-3A53-8DDF-701B190423EE/';
    var Base = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
            url : url1,
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    
    // VWORLD Satellite 설정 
    var Satellite = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
             url : url1,
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    
    // VWORLD Hybrid 설정 
    var Hybrid = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
            url : url1,
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    
    // VWORLD Gray 설정 
    var Gray = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
            url : url1,
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    
    // VWORLD Midnight 설정 
    var Midnight = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
            url : url1,
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    
    // VWORLD Selectbox 설정
    var vbaseStyles = ['Base', 'Satellite', 'Hybrid', 'gray', 'midnight'];
    var VWORLDMap=[];
    for (var i = 0, ii = vbaseStyles.length; i < ii; ++i) {
		if(vbaseStyles[i] === 'Satellite'){ 
			type = 'jpeg'
		} else {
			type = 'png'
		}
		
    	VWORLDMap.push(new ol.layer.Tile({
    		visible: false,
            preload: Infinity,
            source : new ol.source.XYZ({
            	url : url1 + '/' + vbaseStyles[i] + '/{z}/{y}/{x}.' + type
            }),
            zIndex : 3
        }));
    }
       
    var VWORLDMapGroup = new ol.layer.Group({
    	visible: false,
        layers: VWORLDMap
    });

   	/*
    // VWORLD 설정
    var VwordMap = new ol.layer.Tile({
    	visible: false,
        source : new ol.source.XYZ({
            url : 'http://xdworld.vworld.kr:8080/2d/Base/202002/{z}/{x}/{y}.png',
            attributions: [
                new ol.Attribution({ 
                    html: ['&copy; <a href="http://map.vworld.kr">V-World Map</a>'] 
                })
            ]
        }),
        zIndex : 3
    });
    */
   
   /*
   	var wms_title = '지적도';
	var wms_val = 'lp_pa_cbnd_bubun';

	var wms_tile = new ol.layer.Tile({
		name : "WMS_LAYER",
		source : new ol.source.TileWMS({
			url : "http://api.vworld.kr/req/wms?",
			params : {
				LAYERS : wms_val,
				STYLES : wms_val,
				CRS : "EPSG:900913",
				apikey : "CEB52025-E065-364C-9DBA-44880E3B02B8",
				DOMAIN : "http://loacalhost:8080",
				title : wms_title,
				FORMAT : "image/png",
				domain : "http://localhost"
			}
		})
	});
	map.addLayer(wms_tile);
	*/
       
    // GIS:base geoserver 백그라운드레이어 그룹명
    var customBase = new ol.layer.Image({
    	visible: false,
        source: new ol.source.ImageWMS({
            url: 'http://localhost:8080/geoserver/GIS/wms',
            params: {
                'FORMAT': format,
                'VERSION': version,
                'TILED': true,
                'LAYERS': 'GIS:base',
                STYLES: ''
            },
            serverType: 'geoserver'
        }),
        zIndex : 4
    });
            
    // OSM TileGrid 설정
    var TileGrid = new ol.layer.Tile({
    	visible: false,
    	source : new ol.source.TileDebug({
    		projection : projection,
    		tileGrid : new ol.source.OSM().getTileGrid({
    			 minZoom: 7
    		})
    	}),
    	zIndex : 100
    });  
   
    // 지도화면설정
    // controls 설정
    var controls = ol.control.defaults({
    	attributionOptions: {
            collapsible: false
          }
    }).extend([    	
        new ol.control.FullScreen(),
        new ol.control.ZoomSlider(),
        new ol.control.ScaleLine(),
        new ol.control.Zoom(),
        new ol.control.Rotate(),
        new ol.control.Attribution(),
        new ol.control.OverviewMap(),
        new ol.control.ZoomToExtent()
    ]); 
    
    // layers 설정      
    var addLayers = [OSM, BingMapGroup, VWORLDMapGroup, customBase, TileGrid];
    
    // view 설정
    var view = new ol.View({
    	projection : 'EPSG:3857',
    	center : new ol.proj.transform([128.05, 36.10], 'EPSG:4326', 'EPSG:3857'),
    	zoom : 7, // 초기화면 zoom 레벨
        minZoom : 7, // 최소 zoom 레벨
        maxZoom : 22 // 최대 zoom 레벨
    })
     
    // map 설정
    var map = new ol.Map({          	
        controls : controls,
        layers : addLayers,
        loadTilesWhileInteracting: true,
        target : 'map',
        renderer : 'canvas',
        logo : false,
        view : view
    });  
            
    // 마우스 좌표 설정 정상
    var mousePosition = new ol.control.MousePosition({
        coordinateFormat : ol.coordinate.createStringXY(2),
        projection : projection,
        target : document.getElementById('mouseLocation'),
        undefinedHTML : '&nbsp;'
     });    
    map.addControl(mousePosition);  
   
    // 클릭시 현위치 포인트 추가 정상
    var geolocation = new ol.Geolocation({
    	// projection : 'EPSG:3857',
    	projection : map.getView().getProjection(), 
        tracking : true
        });   

    var style = new ol.style.Style({
    	image : new ol.style.Circle({
    		 snapToPixel : true,
    		 radius : 6,
    		 stroke : new ol.style.Stroke({
    			 color : '#a50000',
    			 width : 1
             }),
             fill : new ol.style.Fill({
            	 color : '#e10000'
            })
    	})
    });
    
    // 내위치  
    $('.currentLocation').on('click', function() {
        var position = geolocation.getPosition();      	
        var point = new ol.layer.Vector({
    		source : new ol.source.Vector({
    			features : [ 
    				new ol.Feature({
    				geometry : new ol.geom.Point(position)
    				})
    			]
    		}),
    		style : style,
    		zIndex : 100    		
    	});    	   	        
    	map.addLayer(point);
    	return false;      	
    });      
       
    // 레이어토글
    $('#layerToggle input[type=radio]').on('change', function() {
        var layer = $(this).val();
        map.getLayers().getArray().forEach(function(e) {
            var name = e.get('name');
            e.setVisible(name == layer);
        });
    });
    
    // BingMap SelectBox
    $('#layerSelect').on('change', function() {
    	var style = $(this).find(':selected').val();
        for (var i = 0, ii = BingMap.length; i < ii; ++i) {
        	BingMap[i].setVisible(baseStyles[i] === style);
        }
    });    
    $('#layerSelect').trigger('change');
    
    // VWORLDMap SelectBox
    $('#vworldlayerSelect').on('change', function() {
    	var style = $(this).find(':selected').val();
        for (var i = 0, ii = VWORLDMap.length; i < ii; ++i) {
        	VWORLDMap[i].setVisible(vbaseStyles[i] === style);
        }
    });    
    $('#vworldlayerSelect').trigger('change');
    
    // 초기화 정상
    $('.resetLocation').on('click', function() {
    	view.animate({
    		center : new ol.proj.transform([127.38,36.35],'EPSG:4326', 'EPSG:3857'),
    		zoom: 7,
    		duration:500
    	});
    });
    
    // 확대 정상
    $('.zoom-in').on('click', function() {
        var view = map.getView();
        var zoom = view.getZoom();
        view.setZoom(zoom + 1);
    });

    // 축소 정상
    $('.zoom-out').on('click', function() {
        var view = map.getView();
        var zoom = view.getZoom();
        view.setZoom(zoom - 1);
    });
        
    // 레이어 보이기/숨기기          
    $('.addLand').on('click', function() {    	
    	toggleLayer(DAEJEON_LAND);
    });
    
    function toggleLayer(layerName) {
        if (layerName.getVisible() == true) {
            layerName.setVisible(false);
        } else {
            layerName.setVisible(true);
        }
    }
    
    function hideLayer(layerName) {
        layerName.setVisible(false);
    }
          
    // #layerTree 설정
    function bindInputs(layerid, layer) {
        var visibilityInput = $(layerid + ' input.visible');
        visibilityInput.on('change', function() {
            layer.setVisible(this.checked);
        });
        visibilityInput.prop('checked', layer.getVisible());

        var opacityInput = $(layerid + ' input.opacity');
        opacityInput.on('input change', function() {
            layer.setOpacity(parseFloat(this.value));
        });
        opacityInput.val(String(layer.getOpacity()));
    }
    
    map.getLayers().forEach(function(layer, i) {
        bindInputs('#layer' + i, layer);
        if (layer instanceof ol.layer.Group) {
            layer.getLayers().forEach(function(sublayer, j) {
                bindInputs('#layer' + i + j, sublayer);
            });
        }
    });
    
     // 초기화면 서브메뉴 설정
    $('#layerTree li > span').on('click', function() {
        $(this).siblings('fieldset').toggle();
    }).siblings('fieldset').show();
  
    
});