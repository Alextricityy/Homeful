import "bootstrap";

import "../plugins/slick";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
import { loadDynamicBannerText } from "./typed.js"
if ((window.location.href === "http://localhost:3000/") || (window.location.href === "http://www.homeful.co.uk/")) {
  loadDynamicBannerText();
}
