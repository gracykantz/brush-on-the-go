import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { showOnclick } from '../plugins/show_onclick';

showOnclick();


import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { backgroundCarousel } from '../plugins/init_background_carousel';
backgroundCarousel();

