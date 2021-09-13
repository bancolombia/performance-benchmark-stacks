import { AfterContentInit, AfterViewInit, Component, OnInit } from '@angular/core';
import { ResultsService } from '../../services/results.service';
declare var BcTabsGroupBehavior: any;

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

  showRawJavascript(): void {
    const tabs = new BcTabsGroupBehavior();
    tabs.setElement(document.getElementById("tabs"));
    tabs.setUp();
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
    setTimeout(() => {
      this.showRawJavascript();
    }, 1000);
  }
}
