var mokeGoogle = (function () {

  function ucfirst(str) {
    str += '';
    return str.charAt(0).toUpperCase() + str.substr(1);
  }


  function createGenericObject(options) {
    function F() {
      this.__data = {};
      this.__events = {};
      this.__get = function (name) {
        return this.__data[name];
      };
      if (options.constructor) {
        if (options.constructor === true) { // generic: function (options) { }
          if (angular.isObject(arguments[0])) {
            angular.extend(this.__data, arguments[0]);
          }
        } else {
          options.constructor.apply(this, arguments)
        }
      }
    }

    // append getter / setter for property list
    angular.forEach((options.prop || '').split(' '), function (feature) {
      var spl = feature.split(':'),
        uc = ucfirst(spl[0]);
      if ( (spl.length === 1) || (spl.indexOf('set') > 0) ) {
        F.prototype['set' + uc] = function (value) {
          this.__data[spl[0]] = value;
        };
      }
      if ( (spl.length === 1) || (spl.indexOf('get') > 0) ) {
        F.prototype['get' + uc] = function () {
          return this.__data[spl[0]];
        };
      }
    });
    return F;
  }

  var maps = {};

  maps.Map = createGenericObject({
    prop: 'center div heading mapTypeId projection streetView tilt zoom options',
    constructor: function (mapDiv, options) {
      var self = this;
      self.__data.__mapDiv = mapDiv;
      self.__data.__mapTypes = [];
      angular.extend(self.__data, options);

      this.mapTypes = {
        set: function (id, styles) {
          self.__data.__mapTypes.push({id: id, styles: styles});
        }
      }
    }
  });

  maps.StreetViewPanorama = createGenericObject({
    prop: 'position pov zoom options',
    constructor: function (mapDiv, options) {
      this.__data.__mapDiv = mapDiv;
      angular.extend(this.__data, options);
    }
  });

  maps.Marker = createGenericObject({
    prop: 'animation attribution clickable cursor draggable icon map opacity place position shape title visible zIndex options',
    constructor: true
  });

  maps.Circle = createGenericObject({
    prop: 'bounds center draggable editable map radius visible options',
    constructor: true
  });

  maps.Rectangle = createGenericObject({
    prop: 'bounds draggable editable map visible options',
    constructor: true
  });

  maps.InfoWindow = createGenericObject({
    prop: 'content position zIndex options',
    constructor: true
  });

  maps.Polyline = createGenericObject({
    prop: 'draggable editable map path visible options',
    constructor: true
  });

  maps.Polygon = createGenericObject({
    prop: 'draggable editable map path paths visible options',
    constructor: true
  });

  maps.InfoWindow.prototype.open = function (map, anchor) {
    this.__data.__map = map;
    this.__data.__anchor = anchor;
    this.__data.__opened = true;
  };

  maps.InfoWindow.prototype.close = function () {
    this.__data.__opened = false;
  };

  maps.DirectionsRenderer = createGenericObject({
    prop: 'map directions options',
    constructor: true
  });

  maps.TrafficLayer = createGenericObject({
    prop: 'map options',
    constructor: true
  });

  maps.BicyclingLayer = createGenericObject({
    prop: 'map options',
    constructor: true
  });

  maps.TransitLayer = createGenericObject({
    prop: 'map options',
    constructor: true
  });

  maps.GroundOverlay = createGenericObject({
    prop: 'bounds:get map opacity url:get options',
    constructor: function (url, bounds, options) {
      this.__data.url = url;
      this.__data.bounds = bounds;
      angular.extend(this.__data, options);
    }
  });

  maps.KmlLayer = createGenericObject({
    prop: 'defaultViewport:get map metadata:get status:get url zIndex options',
    constructor: function (url, options) {
      this.__data.url = url;
      angular.extend(this.__data, options);
    }
  });

  maps.StyledMapType = createGenericObject({
    constructor: function (styles, options) {
      this.__data.styles = styles;
      this.__data.options = options;
    }
  });

  maps.LatLng = function (lat, lng) {

    this.lat = function () {
      return lat;
    };

    this.lng = function () {
      return lng;
    };
  };

  maps.LatLngBounds = function (sw, ne) {

    this.sw = function () {
      return sw;
    };

    this.ne = function () {
      return ne;
    };
  };



  maps.event = (function () {

    function add(obj, name, fn, once) {
      obj.__events[name] = (obj.__events[name] || []);
      obj.__events[name].push({fn: fn, once: once});
      return obj.__events[name]. length - 1;
    }

    return {
      addListener: function (obj, name, fn) {
        return add(obj, name, fn, false);
      },
      addListenerOnce: function (obj, name, fn) {
        return add(obj, name, fn, true);
      },
      trigger: function (obj, name) {
        if (obj && obj.__events && obj.__events[name]) {
          angular.forEach(obj.__events[name], function (item, key) {
            if (item) {
              if (item.once) {
                obj.__events[name][key] = null;
              }
              item.fn();
            }
          });
        }
      }
    };
  }());


  maps.DirectionsService = function () {
    this.route = function (options, callback) {
      setTimeout(function () {
        callback({options: options}, 'status');
      });
    }
  };

  maps.GeocoderStatus = {
    ERROR: "ERROR",
    INVALID_REQUEST: "INVALID_REQUEST",
    OK: "OK",
    OVER_QUERY_LIMIT: "OVER_QUERY_LIMIT",
    REQUEST_DENIED: "REQUEST_DENIED",
    UNKNOWN_ERROR: "UNKNOWN_ERROR",
    ZERO_RESULTS: "ZERO_RESULTS"
  };


  maps.Geocoder = function () {
    /**
     * will return LatLng using address: e.g:  100,200 => LatLng(100,200)
     * if address.options equal one of the GeocoderStatus, will return this status as result
     * @param options
     * @param callback
     */
    this.geocode = function (options, callback) {
      setTimeout(function () {
        var values, results, status;
        if (options.address in maps.GeocoderStatus) {
          status = options.address;
        } else {
          values = options.address.split(',');
          results = [
            {
              geometry: {
                location: new maps.LatLng(1*values[0], 1*values[1])
              }
            }
          ];
          status = maps.GeocoderStatus.OK;
        }
        callback(results, status);
      });
    }
  };


  return {maps: maps}
}());