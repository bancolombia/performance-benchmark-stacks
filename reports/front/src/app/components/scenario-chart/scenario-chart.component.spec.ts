import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ScenarioChartComponent } from './scenario-chart.component';

describe('ScenarioChartComponent', () => {
  let component: ScenarioChartComponent;
  let fixture: ComponentFixture<ScenarioChartComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ScenarioChartComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ScenarioChartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
