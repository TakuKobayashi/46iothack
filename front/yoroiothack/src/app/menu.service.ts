import { Injectable } from '@angular/core';
import {Menu} from "./menu";

@Injectable()
export class MenuService {

  menus: Menu[];
  selectedMenu: Menu[];

  constructor() {
    this.menus = [
      {
        category: `前菜`,
        name: `枝豆`,
        price: 300
      },
      {
        category: `揚げ物`,
        name: `唐揚げ`,
        price: 600
      },
      {
        category: `ご飯物`,
        name: `鮭チャーハン`,
        price: 750
      },
      {
        category: `デザート`,
        name: `バニラアイス`,
        price: 180
      }
    ]
  }

  getMenus(): Menu[] {
    return this.menus;
  }

  

}
