import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

export default class extends Controller {
  connect() {
    const ctx = this.element.getContext("2d");
    new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: JSON.parse(ctx.canvas.dataset.labels),
        datasets: [{
          label: 'Total Expenses',
          data: JSON.parse(ctx.canvas.dataset.data),
          backgroundColor: [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)'
          ],
          hoverOffset: 4
        }]
      },
      options: {
        elements: {
          center: {
            text: `${JSON.parse(ctx.canvas.dataset.text)}`,
            color: 'rgb(255, 99, 132)', // Default is #000000
            fontStyle: 'Arial', // Default is Arial
            sidePadding: 20, // Default is 20 (as a percentage)
            minFontSize: 20, // Default is 20 (in px), set to false and text will not wrap.
            lineHeight: 25 // Default is 25 (in px), used for when text wraps
          }
        }
      }
    });
  }
}
