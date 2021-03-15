import {Component, OnInit} from '@angular/core';
import {ResultsService} from "../../services/results.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'front';
  scenarios = [];
  charts: any;

  constructor(private dataService: ResultsService) {
  }

  ngOnInit(): void {
    this.dataService.loadResults()
      .subscribe(data => this.buildCharts(data));
  }

  public scenarioData(scenario): any {
    return this.charts[scenario];
  }

  buildCharts(data): void {
    this.charts = data;
    this.scenarios = Object.keys(data);
  }

}

