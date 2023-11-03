import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientModule } from '@angular/common/http';
import { ProovedoresComponent } from './proovedores.component';

describe('ProovedoresComponent', () => {
  let component: ProovedoresComponent;
  let fixture: ComponentFixture<ProovedoresComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ProovedoresComponent]
    });
    fixture = TestBed.createComponent(ProovedoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
