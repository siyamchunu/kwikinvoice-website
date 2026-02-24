/**
 * Pricing Toggle Functionality
 * Switches between monthly and annual pricing
 */

(function() {
  'use strict';

  // Wait for DOM to be ready
  document.addEventListener('DOMContentLoaded', function() {
    const toggle = document.getElementById('pricingToggle');
    
    if (!toggle) return; // Exit if toggle doesn't exist on page

    // Elements to toggle
    const priceMonthly = document.querySelector('.price-monthly');
    const priceAnnual = document.querySelector('.price-annual');
    const periodMonthly = document.querySelector('.price-period-monthly');
    const periodAnnual = document.querySelector('.price-period-annual');
    const ctaMonthly = document.querySelector('.cta-monthly');
    const ctaAnnual = document.querySelector('.cta-annual');
    const annualEquivalent = document.querySelector('.annual-equivalent');
    const noteMonthly = document.querySelector('.card-note-monthly');
    const noteAnnual = document.querySelector('.card-note-annual');

    // Handle toggle change
    toggle.addEventListener('change', function() {
      const isAnnual = this.checked;

      // Toggle prices
      if (priceMonthly) priceMonthly.style.display = isAnnual ? 'none' : 'inline';
      if (priceAnnual) priceAnnual.style.display = isAnnual ? 'inline' : 'none';

      // Toggle periods
      if (periodMonthly) periodMonthly.style.display = isAnnual ? 'none' : 'inline';
      if (periodAnnual) periodAnnual.style.display = isAnnual ? 'inline' : 'none';

      // Toggle CTAs
      if (ctaMonthly) ctaMonthly.style.display = isAnnual ? 'none' : 'inline';
      if (ctaAnnual) ctaAnnual.style.display = isAnnual ? 'inline' : 'none';

      // Toggle annual equivalent text
      if (annualEquivalent) annualEquivalent.style.display = isAnnual ? 'block' : 'none';

      // Toggle notes
      if (noteMonthly) noteMonthly.style.display = isAnnual ? 'none' : 'block';
      if (noteAnnual) noteAnnual.style.display = isAnnual ? 'block' : 'none';
    });

    // Optional: Track toggle interaction with analytics
    toggle.addEventListener('change', function() {
      if (typeof gtag !== 'undefined') {
        gtag('event', 'pricing_toggle', {
          'event_category': 'engagement',
          'event_label': this.checked ? 'annual' : 'monthly'
        });
      }
    });
  });
})();
