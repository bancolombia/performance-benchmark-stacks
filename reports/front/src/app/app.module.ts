import {BrowserModule} from '@angular/platform-browser';
import {HttpClientModule} from '@angular/common/http';
import {NgModule} from '@angular/core';

import {AppRoutingModule} from './app-routing.module';
import {ScenarioReportComponent} from './components/scenario-report/scenario-report.component';
import {AppComponent} from "./components/app/app.component";
import {ScenarioChartComponent} from "./components/scenario-chart/scenario-chart.component";

@NgModule({
  declarations: [
    AppComponent,
    ScenarioChartComponent,
    ScenarioReportComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
