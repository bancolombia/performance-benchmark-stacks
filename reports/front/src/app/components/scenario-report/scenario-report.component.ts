import {Component, Input, OnInit} from '@angular/core';

@Component({
  selector: 'app-scenario-report',
  templateUrl: './scenario-report.component.html',
  styleUrls: ['./scenario-report.component.scss']
})
export class ScenarioReportComponent implements OnInit {
  @Input() scenario: string;
  @Input() metric: string;
  @Input() data: any;

  constructor() {
  }

  ngOnInit(): void {
  }

  metrics() {
    return Object.keys(this.data[Object.keys(this.data)[0]]).filter(value => value !== 'concurrency');
  }

}
