import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoProcutosAdminComponent } from './info-procutos-admin.component';

describe('InfoProcutosAdminComponent', () => {
  let component: InfoProcutosAdminComponent;
  let fixture: ComponentFixture<InfoProcutosAdminComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InfoProcutosAdminComponent]
    });
    fixture = TestBed.createComponent(InfoProcutosAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
