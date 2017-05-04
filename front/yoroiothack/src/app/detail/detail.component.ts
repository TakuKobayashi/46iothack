import { Component, OnInit } from '@angular/core';
import { Router } from "@angular/router";

import { Menu } from "../menu";
import { MenuService } from "../menu.service";

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.sass']
})
export class DetailComponent implements OnInit {

  private menus: Menu[];
  private totalPrice: number;

  constructor(private menuService: MenuService,
              private router: Router) {}

  ngOnInit() {
    this.init();
  }

  private init(): void {
    this.menuService.getMenus().subscribe((menus) => {
      this.menus = menus;
      this.calcTotal();
    });
  }

  onClickDelete(menu: Menu): void {
    this.menus = this.menuService.deleteMenu(menu);
    this.calcTotal();
  }

  onClickOrder(): void {
    this.menuService.order().then((response) => {
      if (response) {
        this.router.navigate(['/complete']);
      }
    });
  }

  calcTotal(): void {
    this.totalPrice = 0;
    this.menus.map((menu) => {
      this.totalPrice += menu.price_in;
    });
  }

}
