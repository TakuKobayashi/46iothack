import { Component, OnInit } from '@angular/core';
import { Menu } from "../menu";
import { MenuService } from "../menu.service";

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
    this.menuService.getMenus().subscribe(
      menus => this.menus = menus
    );
  }

  onClickDelete(menu: Menu): void {
    this.menus = this.menuService.deleteMenu(menu);
  }

  onClickOrder(): void {
    console.log(`click order`);
  }

}
