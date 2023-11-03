import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductosClienteComponent } from './productos-cliente.component';

describe('ProductosClienteComponent', () => {
  let component: ProductosClienteComponent;
  let fixture: ComponentFixture<ProductosClienteComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ProductosClienteComponent]
    });
    fixture = TestBed.createComponent(ProductosClienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
