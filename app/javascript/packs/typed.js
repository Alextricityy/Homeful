import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#homeful-typed', {
    strings: ["meaningful", "life changing", "specific", "special", ""],
    typeSpeed: 80,
    loop: true
  });
}

// if (window.location.href === "https://localhost:3000") {
//   loadDynamicBannerText();
// }
export {loadDynamicBannerText}
