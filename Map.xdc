{
    "xdsVersion": "3.1.0",
    "frameworkVersion": "touch23",
    "internals": {
        "type": "Ext.Container",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "address": "",
            "container|animation": "flip",
            "designer|userAlias": "maps",
            "designer|userClassName": "Map",
            "lat": "",
            "layout": "card",
            "linkId": "launchexternalguidancelink",
            "lng": "",
            "requires": [
                "Ext.MessageBox"
            ],
            "title": ""
        },
        "name": "Map",
        "customConfigs": [
            {
                "group": "(Custom Properties)",
                "name": "lat",
                "type": "string"
            },
            {
                "group": "(Custom Properties)",
                "name": "lng",
                "type": "string"
            },
            {
                "group": "(Custom Properties)",
                "name": "address",
                "type": "string"
            },
            {
                "group": "(Custom Properties)",
                "name": "title",
                "type": "string"
            },
            {
                "group": "(Custom Properties)",
                "name": "linkId",
                "type": "string"
            }
        ],
        "cn": [
            {
                "type": "Ext.Toolbar",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "container|pack": "center",
                    "docked": "top",
                    "itemId": "mapstoolbar"
                },
                "name": "MyToolbar6",
                "cn": [
                    {
                        "type": "Ext.SegmentedButton",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "container|pack": null,
                            "itemId": "mapsviewcontrol"
                        },
                        "name": "MySegmentedButton3",
                        "cn": [
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "pressed": true,
                                    "text": "Map"
                                },
                                "name": "MyButton9",
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "fn": "handler",
                                            "implHandler": [
                                                "button.up('maps').setActiveItem(0);"
                                            ]
                                        },
                                        "name": "handler"
                                    }
                                ]
                            },
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "text": "Directions"
                                },
                                "name": "MyButton10",
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "fn": "handler",
                                            "implHandler": [
                                                "Ext.Viewport.setMasked({ xtype: 'loadmask', indicator: true, message: 'Please Wait ...'});",
                                                "",
                                                "var top = button.up('maps');",
                                                "var pos = new google.maps.LatLng(top.getLat(),top.getLng());",
                                                "var me = top;",
                                                "",
                                                "top.getCurrentPosition(function(currentLoc) {",
                                                "",
                                                "",
                                                "    me.currentLocation = currentLoc;",
                                                "",
                                                "    var directionsService = new google.maps.DirectionsService();",
                                                "",
                                                "",
                                                "    // kill old directions",
                                                "    if (me.directionsRenderer)",
                                                "    me.directionsRenderer.setMap(null);",
                                                "",
                                                "    me.directionsRenderer = new google.maps.DirectionsRenderer({",
                                                "        'map': top.down('map').getMap(),",
                                                "        'preserveViewport':true,",
                                                "        'draggable':false",
                                                "    });",
                                                "",
                                                "    // clear directions view",
                                                "",
                                                "    document.getElementById(\"turnByTurnDirections\").innerHTML = \"\";",
                                                "    me.directionsRenderer.setPanel(document.getElementById(\"turnByTurnDirections\"));",
                                                "",
                                                "    var end = new google.maps.LatLng(top.getLat(), top.getLng());",
                                                "",
                                                "    var request = {",
                                                "        origin:currentLoc,",
                                                "        destination:end,",
                                                "        travelMode:me.directionsMode",
                                                "    };",
                                                "",
                                                "    directionsService.route(request, function (response, status) {",
                                                "        if (status == google.maps.DirectionsStatus.OK) {",
                                                "            me.directionsRenderer.setDirections(response);",
                                                "            me.directionsResponse = response;",
                                                "            Ext.Viewport.setMasked(false);",
                                                "            top.setActiveItem(1);",
                                                "        } else {",
                                                "            Ext.Viewport.setMasked(false);",
                                                "            Ext.Msg.alert(\"Error\", \"Could not determine directions. Please enable your GPS\");",
                                                "        }",
                                                "    });",
                                                "});",
                                                "",
                                                ""
                                            ]
                                        },
                                        "name": "handler"
                                    }
                                ]
                            },
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "text": "Street View"
                                },
                                "name": "MyButton11",
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "fn": "handler",
                                            "implHandler": [
                                                "// Ext.Viewport.setMasked({ xtype: 'loadmask', indicator: true, message: 'Please Wait ...'});",
                                                "",
                                                "var findNearest = true; // only use if lat/lng is \"questionable\"",
                                                "var top = button.up('maps');",
                                                "var webService = new google.maps.StreetViewService();",
                                                "var pos = new google.maps.LatLng(top.getLat(),top.getLng());",
                                                "var domObj = document.getElementById('streetview');",
                                                "",
                                                "",
                                                "if (!findNearest) {",
                                                "     var panoramaOptions = {",
                                                "         addressControl:true,",
                                                "         // position:panoData.location.latLng,",
                                                "         position: pos,",
                                                "         pov:{",
                                                "             heading:290,",
                                                "             pitch:0,",
                                                "             zoom:1",
                                                "         }",
                                                "     };",
                                                "    var myPano = new google.maps.StreetViewPanorama(domObj, panoramaOptions);",
                                                "    top.setActiveItem(2);",
                                                "} else {",
                                                "    /**Check in a perimeter of 10 meters**/",
                                                "    var checkaround = 20;",
                                                "",
                                                "    webService.getPanoramaByLocation(pos, checkaround, function (panoData) {",
                                                "        Ext.Viewport.setMasked(false);",
                                                "        if (panoData) {",
                                                "            if (panoData.location) {",
                                                "                if (panoData.location.latLng) {",
                                                "                    var panoramaOptions = {",
                                                "                        addressControl:true,",
                                                "                        position:panoData.location.latLng,",
                                                "                        pov:{",
                                                "                            heading:290,",
                                                "                            pitch:0,",
                                                "                            zoom:1",
                                                "                        }",
                                                "                    };",
                                                "                    var myPano = new google.maps.StreetViewPanorama(domObj, panoramaOptions);",
                                                "                }",
                                                "            }",
                                                "        } else {",
                                                "            Ext.Msg.alert(\"Not Available\", \"Street View is not available for this location\");",
                                                "        }",
                                                "     });",
                                                "    top.setActiveItem(2);",
                                                "}"
                                            ]
                                        },
                                        "name": "handler"
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "Ext.Button",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "text": "Navigate"
                        },
                        "name": "MyButton12",
                        "cn": [
                            {
                                "type": "fixedfunction",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "designer|params": [
                                        "button",
                                        "event"
                                    ],
                                    "fn": "handler",
                                    "implHandler": [
                                        "//Should work, needs testing on actual mobile devices",
                                        "var top = button.up('maps');",
                                        "var lat = top.getLat();",
                                        "var lng = top.getLng();",
                                        "var title = top.getTitle();",
                                        "var mapUrl = 'http://maps.google.com/maps?z=15&t=m&q=loc:' +",
                                        "lat + '+' + lng;",
                                        "",
                                        "top.openLinkInNewWindow(mapUrl);"
                                    ]
                                },
                                "name": "handler"
                            }
                        ]
                    }
                ]
            },
            {
                "type": "Ext.Map",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "itemId": "mymap"
                },
                "name": "MyMap",
                "cn": [
                    {
                        "type": "basiceventbinding",
                        "reference": {
                            "name": "listeners",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "fn": "onMyMapRender",
                            "implHandler": [
                                "var top = map.up('maps');",
                                "",
                                "var pos = new google.maps.LatLng(top.getLat(),top.getLng());",
                                "",
                                "map.setMapOptions({",
                                "    zoom: 15,",
                                "    mapTypeId: google.maps.MapTypeId.ROADMAP,",
                                "    navigationControl: true,",
                                "    navigationControlOptions: {",
                                "        style: google.maps.NavigationControlStyle.DEFAULT",
                                "    },",
                                "    center: pos",
                                "});",
                                "",
                                "",
                                "this.centerMap(map.getMap(),pos,top.getTitle(),'');",
                                "",
                                "// this shouldn't be required...and yet there's clearly",
                                "// some sort of race condition going on...",
                                "// so re-center after 1 second",
                                "Ext.defer(",
                                "  function(map,lat,lng) {",
                                "    map.setMapCenter({",
                                "        latitude: lat,",
                                "        longitude: lng",
                                "    });",
                                "  }, ",
                                "    1000,",
                                "    this,",
                                "    [map,top.getLat(),top.getLng()]",
                                " );",
                                "",
                                "Ext.Viewport.setMasked(false);"
                            ],
                            "name": "maprender"
                        },
                        "name": "onMyMapRender"
                    }
                ]
            },
            {
                "type": "Ext.Container",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "html": "<div id=\"turnByTurnDirections\"></div>",
                    "itemId": "directions",
                    "scrollable": true
                },
                "name": "MyContainer1"
            },
            {
                "type": "Ext.Container",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "id": "streetview"
                },
                "name": "MyContainer2"
            },
            {
                "type": "fixedfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "fn": "initialize",
                    "implHandler": [
                        "this.callParent(arguments);\r",
                        "\r",
                        "this.directionsMode = google.maps.DirectionsTravelMode.DRIVING;\r",
                        "\r",
                        "Ext.Viewport.setMasked({ xtype: 'loadmask', indicator: true, message: 'Please Wait ...'});\r",
                        ""
                    ]
                },
                "name": "initialize"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "lat1",
                        "lng1",
                        "lat2",
                        "lng2"
                    ],
                    "fn": "calcDistance",
                    "implHandler": [
                        " var R = 6371;",
                        "// km",
                        "var dLat = this.toRad((lat2 - lat1));",
                        "var dLon = this.toRad(lng2 - lng1);",
                        "var lat1 = this.toRad(lat1);",
                        "var lat2 = this.toRad(lat2);",
                        "",
                        "var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);",
                        "var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));",
                        "var d = R * c;",
                        "",
                        "return d;"
                    ]
                },
                "name": "calcDistance"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "num"
                    ],
                    "fn": "toRad",
                    "implHandler": [
                        "return num * Math.PI / 180;"
                    ]
                },
                "name": "toRad"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "gMap",
                        "loc",
                        "title",
                        "desc",
                        "callback",
                        "scope"
                    ],
                    "fn": "centerMap",
                    "implHandler": [
                        " if(loc != null) {",
                        "     gMap.setCenter(loc);",
                        "     this.plotLocation(gMap, loc, title, desc);",
                        " } else {",
                        "     navigator.geolocation.getCurrentPosition(function(position) {",
                        "         var initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);",
                        "         gMap.setCenter(initialLocation);",
                        "         callback.call(scope, initialLocation);",
                        "     }, function() {",
                        "         Ext.Msg.alert(\"Error\", \"Could not get your position.<br />Try enabling your GPS.\");",
                        "     });",
                        " }"
                    ]
                },
                "name": "centerMap"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "address",
                        "callback"
                    ],
                    "fn": "geoCodeAddress",
                    "implHandler": [
                        "var geocoder = new google.maps.Geocoder();",
                        "",
                        "geocoder.geocode({",
                        "    'address' : address",
                        "}, function(results, status) {",
                        "    if(status != google.maps.GeocoderStatus.OK) {",
                        "        Ext.Msg.alert(\"Address not found\", status);",
                        "    } else {",
                        "        callback(results[0].geometry.location, results[0].formatted_address);",
                        "    }",
                        "});"
                    ]
                },
                "name": "geoCodeAddress"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "address"
                    ],
                    "fn": "geoCodeAddressRet",
                    "implHandler": [
                        "  var geocoder = new google.maps.Geocoder();",
                        "",
                        "geocoder.geocode({",
                        "    'address' : address",
                        "}, function(results, status) {",
                        "    if(status != google.maps.GeocoderStatus.OK) {",
                        "        Ext.Msg.alert(\"Address not found\", status);",
                        "    } else {",
                        "        return [results[0].geometry.location.lat(), results[0].geometry.location.lng()];",
                        "    }",
                        "});"
                    ]
                },
                "name": "geoCodeAddressRet"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "objMap",
                        "pos",
                        "title",
                        "content"
                    ],
                    "fn": "plotLocation",
                    "implHandler": [
                        "",
                        "var marker = new google.maps.Marker({",
                        "    position : pos,",
                        "    map : objMap,",
                        "    title : title",
                        "});",
                        "",
                        "if( typeof content == 'string' && content != '') {",
                        "    var infoWindow = new google.maps.InfoWindow({",
                        "        content : content",
                        "    });",
                        "    google.maps.event.addListener(marker, 'click', function() {",
                        "        infoWindow.open(objMap, marker);",
                        "    });",
                        "} else if( typeof content == 'function') {",
                        "",
                        "    google.maps.event.addListener(marker, 'click', content);",
                        "}"
                    ]
                },
                "name": "plotLocation"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "origin",
                        "destination",
                        "travelMode",
                        "callback"
                    ],
                    "fn": "getDirections",
                    "implHandler": [
                        "var travelModes = [google.maps.TravelMode.DRIVING, google.maps.TravelMode.WALKING, google.maps.TravelMode.BICYCLING];",
                        "",
                        "var directionsService = new google.maps.DirectionsService();",
                        "var request = {",
                        "    origin : origin,",
                        "    destination : destination,",
                        "    travelMode : travelModes[travelMode]",
                        "};",
                        "directionsService.route(request, function(response, status) {",
                        "    if(status == google.maps.DirectionsStatus.OK) {",
                        "        callback(response);",
                        "    }",
                        "});"
                    ]
                },
                "name": "getDirections"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "pos",
                        "domID"
                    ],
                    "fn": "streetView",
                    "implHandler": [
                        "var panoramaOptions = {",
                        "    position : pos,",
                        "    pov : {",
                        "        heading : 34,",
                        "        pitch : 10,",
                        "        zoom : 1",
                        "    }",
                        "};",
                        "var panorama = new google.maps.StreetViewPanorama(document.getElementById(domID), panoramaOptions);"
                    ]
                },
                "name": "streetView"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "callback",
                        "scope",
                        "bSurpressWarning"
                    ],
                    "fn": "getCurrentPosition",
                    "implHandler": [
                        "navigator.geolocation.getCurrentPosition(",
                        "    function(position) {",
                        "        var initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);",
                        "        callback.call(scope, initialLocation);",
                        "    }, ",
                        "    function() {",
                        "        if(!bSurpressWarning) {",
                        "            Ext.Msg.alert(\"Error\", \"Could not get your position.\", function() {",
                        "                callback.call(scope, new google.maps.LatLng(0,0));",
                        "            });",
                        "        }",
                        "    }",
                        ");"
                    ]
                },
                "name": "getCurrentPosition"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "callback",
                        "scope"
                    ],
                    "fn": "getCurrentAddress",
                    "implHandler": [
                        "this.getCurrentPosition(function(latLng) {",
                        "    var geocoder = new google.maps.Geocoder();",
                        "    geocoder.geocode({",
                        "        'latLng' : latLng",
                        "    }, function(results, status) {",
                        "        if(status == google.maps.GeocoderStatus.OK) {",
                        "            callback.call(scope, results);",
                        "        }",
                        "    });",
                        "});"
                    ]
                },
                "name": "getCurrentAddress"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "fn": "addHelperLinkToBody",
                    "implHandler": [
                        "if (!Ext.get(this.getLinkId())) {",
                        "    Ext.DomHelper.append(",
                        "        Ext.getBody(),",
                        "        {",
                        "            tag: 'a',",
                        "            style: 'display:none;',",
                        "            id: this.getLinkId(),",
                        "            target: '_system'",
                        "",
                        "        }",
                        "    );",
                        "}"
                    ]
                },
                "name": "addHelperLinkToBody"
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|params": [
                        "url"
                    ],
                    "fn": "openLinkInNewWindow",
                    "implHandler": [
                        "this.addHelperLinkToBody();",
                        "if (Ext.os.is.iOS && Ext.device !== undefined) {",
                        "    window.open(url, \"_system\"); //_system opens it in Safari",
                        "    //_self opens in the same window. On iOS, it contains a back button which android doesn't.",
                        "} else {",
                        "    var link = Ext.getDom(this.getLinkId()),",
                        "        clickevent = document.createEvent('Event');",
                        "",
                        "    link.href = url;",
                        "",
                        "    clickevent.initEvent('click', true, false);",
                        "    link.dispatchEvent(clickevent);",
                        "}"
                    ]
                },
                "name": "openLinkInNewWindow"
            }
        ]
    },
    "linkedNodes": {},
    "boundStores": {},
    "boundModels": {}
}