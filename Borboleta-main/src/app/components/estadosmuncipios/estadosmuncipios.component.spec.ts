import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstadosmuncipiosComponent } from './estadosmuncipios.component';

describe('EstadosmuncipiosComponent', () => {
  let component: EstadosmuncipiosComponent;
  let fixture: ComponentFixture<EstadosmuncipiosComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [EstadosmuncipiosComponent]
    });
    fixture = TestBed.createComponent(EstadosmuncipiosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
