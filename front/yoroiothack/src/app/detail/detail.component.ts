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
  private selectedMenus: Menu[];
  private categoryList : string[];

  constructor(private menuService: MenuService) {}

  ngOnInit() {
    this.init();
  }

  private init(): void {
    this.menus         = this.menuService.getMenus();
    this.selectedMenus = this.menuService.getSelectedMenus();
    this.categoryList  = CATEGORY;
  }

  clickAdd(category: string): void {
    console.log(`${category}を追加`);
  }

  getCategoryMenu(category: string): Menu[] {
    return this.menus.filter((menu) => menu.category_name === category);
  }

  getSelectedMenuByCategory(category: string): Menu[] {
    return this.selectedMenus.filter((menu) => menu.category_name === category);
  }

  selectMenu(menu: Menu): void {
    this.selectedMenus = this.menuService.addMenu(menu);
    console.log(this.selectedMenus);

  }

}
