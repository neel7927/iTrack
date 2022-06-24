import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

export default class extends Controller {
  connect() {
    new Chart(this.element, {
      type: 'doughnut',
      data: {
        labels: JSON.parse(this.element.canvas.dataset.labels),
        datasets: [{
          label: 'Total Expenses',
          data: JSON.parse(this.element.canvas.dataset.data),
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
          ],
          hoverOffset: 4
        }]
      }
    });
  }
}
