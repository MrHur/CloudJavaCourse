const vetCardSlider = document.querySelector('.vet-card-slider');
const vetCards = vetCardSlider.getElementsByClassName('vet-card');

// Add event listener to handle left/right scrolling
vetCardSlider.addEventListener('wheel', (event) => {
  event.preventDefault();
  vetCardSlider.scrollLeft += event.deltaY;
});

// Dynamically generate vet cards
for (let i = 2; i <= 8; i++) {
  const vetCard = document.createElement('div');
  vetCard.classList.add('vet-card');

  const img = document.createElement('img');
  img.src = `vet-image-${i}.jpg`;
  img.alt = `Veterinary Clinic ${i}`;

  const h3 = document.createElement('h3');
  h3.textContent = `Veterinary Clinic ${i}`;

  const p = document.createElement('p');
  p.textContent = `Description of Veterinary Clinic ${i}`;

  vetCard.appendChild(img);
  vetCard.appendChild(h3);
  vetCard.appendChild(p);

  vetCardSlider.appendChild(vetCard);
}

// Auto-rotate the slider
let currentIndex = 0;
const rotateInterval = setInterval(() => {
  vetCardSlider.scrollLeft = currentIndex * vetCards[0].offsetWidth;
  currentIndex = (currentIndex + 1) % vetCards.length;
}, 1000);

// Stop auto-rotation on user interaction
vetCardSlider.addEventListener('mouseenter', () => {
  clearInterval(rotateInterval);
});

vetCardSlider.addEventListener('mouseleave', () => {
  rotateInterval = setInterval(() => {
    vetCardSlider.scrollLeft = currentIndex * vetCards[0].offsetWidth;
    currentIndex = (currentIndex + 1) % vetCards.length;
  }, 1000);
});