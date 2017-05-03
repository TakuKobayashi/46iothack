import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { EasySelectComponent } from './easy-select/easy-select.component';
import {RouterModule} from "@angular/router";
import { IndexComponent } from './index/index.component';
import { LoginComponent } from './login/login.component';
import { DetailComponent } from './detail/detail.component';
import {MenuService} from "./menu.service";

@NgModule({
  declarations: [
    AppComponent,
    EasySelectComponent,
    IndexComponent,
    LoginComponent,
    DetailComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    RouterModule.forRoot([
      {
        path: '',
        component: IndexComponent
      },
      {
        path: 'easy-select',
        component: EasySelectComponent
      },
      {
        path: 'detail',
        component: DetailComponent
      },
      {
        path: 'login',
        component: LoginComponent
      },
    ])
  ],
  providers: [
    MenuService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
