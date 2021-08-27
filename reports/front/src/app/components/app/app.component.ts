import {Component, OnInit} from '@angular/core';
import {ResultsService} from '../../services/results.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  title = 'front';
  scenarios = [];
  charts: any;
  modeText = 'Enable Light Mode!';

  constructor(private dataService: ResultsService) {
  }

  ngOnInit(): void {
    this.dataService.loadResults().subscribe((data) => this.buildCharts(data));
  }

  public scenarioData(scenario): any {
    return this.charts[scenario];
  }

  buildCharts(data): void {
    this.charts = data;
    this.scenarios = Object.keys(data);
  }

  switchTheme(checked) {
    var link = document.createElement('link');
    if (checked) {
      this.modeText = 'Disabled Dark Mode!';
      document.documentElement.setAttribute('data-theme', 'dark');
      link.href =
        'https://galatea-dev.apps.ambientesbc.com/2.0.0/bds-black.min.css';
    } else {
      this.modeText = 'Enable Dark Mode!';

      document.documentElement.setAttribute('data-theme', 'light');

      link.href = 'https://galatea-dev.apps.ambientesbc.com/2.0.0/bds.min.css';
    }
    link.type = 'text/css';
    link.rel = 'stylesheet';
    link.media = 'screen,print';
    document.getElementsByTagName('head')[0].lastChild.remove();
    document.getElementsByTagName('head')[0].appendChild(link);
  }
}
