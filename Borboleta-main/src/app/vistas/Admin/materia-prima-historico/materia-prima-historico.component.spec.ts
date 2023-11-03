import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientModule } from '@angular/common/http';
import { MateriaPrimaHistoricoComponent } from './materia-prima-historico.component';
import { ProyectoApiService } from 'src/app/proyecto-api.service';

describe('MateriaPrimaHistoricoComponent', () => {
  let component: MateriaPrimaHistoricoComponent;
  let fixture: ComponentFixture<MateriaPrimaHistoricoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientModule], // Importa HttpClientModule
      declarations: [MateriaPrimaHistoricoComponent],
      providers: [ProyectoApiService], 
    });
    fixture = TestBed.createComponent(MateriaPrimaHistoricoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
