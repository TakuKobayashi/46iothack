import { Component, OnInit } from '@angular/core';
import {Menu} from "../menu";
import {MenuService} from "../menu.service";

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.sass']
})
export class DetailComponent implements OnInit {

  private menus: Menu[];

  constructor(private menuService: MenuService) {}

  ngOnInit() {
    this.init();
  }

  private init(): void {
    this.menus = this.menuService.getMenus();
    console.log(this.menus);
  }

}
