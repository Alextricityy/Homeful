import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#homeful-typed', {
    strings: [
    "meaningful",
    "life changing",
    "helpful",
    "amazing",
    "easy",
    "wonderful",
    "incredible",
    ],
    typeSpeed: 80,
    loop: true
  });
}

if (window.location.href === "http://www.homeful.co.uk/") {
  loadDynamicBannerText();
}
