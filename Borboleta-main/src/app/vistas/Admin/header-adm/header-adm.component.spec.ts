import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HeaderAdmComponent } from './header-adm.component';

describe('HeaderAdmComponent', () => {
  let component: HeaderAdmComponent;
  let fixture: ComponentFixture<HeaderAdmComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [HeaderAdmComponent]
    });
    fixture = TestBed.createComponent(HeaderAdmComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
