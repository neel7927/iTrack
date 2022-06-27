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
    });
  }
}
