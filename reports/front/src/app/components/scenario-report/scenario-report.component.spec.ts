import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ScenarioReportComponent } from './scenario-report.component';

describe('ScenarioReportComponent', () => {
  let component: ScenarioReportComponent;
  let fixture: ComponentFixture<ScenarioReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ScenarioReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ScenarioReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
