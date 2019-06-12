import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('product_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
