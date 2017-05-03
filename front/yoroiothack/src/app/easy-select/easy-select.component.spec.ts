import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EasySelectComponent } from './easy-select.component';

describe('EasySelectComponent', () => {
  let component: EasySelectComponent;
  let fixture: ComponentFixture<EasySelectComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EasySelectComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EasySelectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
