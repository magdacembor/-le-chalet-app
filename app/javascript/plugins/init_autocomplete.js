import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('index_address');
  const chaletInput = document.getElementById('chalet_address');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
  if (chaletInput) {
    places({ container: chaletInput });
  }
};

export { initAutocomplete };
