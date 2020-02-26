import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('index_address');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
