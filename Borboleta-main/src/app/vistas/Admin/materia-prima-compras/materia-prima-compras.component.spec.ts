import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MateriaPrimaComprasComponent } from './materia-prima-compras.component';

describe('MateriaPrimaComprasComponent', () => {
  let component: MateriaPrimaComprasComponent;
  let fixture: ComponentFixture<MateriaPrimaComprasComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MateriaPrimaComprasComponent]
    });
    fixture = TestBed.createComponent(MateriaPrimaComprasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
