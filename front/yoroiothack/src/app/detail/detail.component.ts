import { Component, OnInit } from '@angular/core';
import { Menu } from "../menu";
import { MenuService, CATEGORY } from "../menu.service";

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.sass']
})
export class DetailComponent implements OnInit {

  private menus: Menu[];
  private categoryList : string[];

  constructor(private menuService: MenuService) {}

  ngOnInit() {
    this.init();
  }

  private init(): void {
    this.menuService.getMenus().subscribe(
      menus => this.menus = menus
    );
    this.categoryList  = CATEGORY;
    console.log(this.menus);
    console.log(this.categoryList);
  }

  onClickOrder(): void {
    console.log(`click order`);
  }

}
