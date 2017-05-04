import {Observable} from "rxjs";
import { Injectable } from '@angular/core';
import {Menu} from "./menu";

export const CATEGORY: string[] = [
  `まずはコレっ！！`, `サラダ`, `刺身`, `串焼`, `焼物`, `旨い物`,
  `揚物`, `鉄板焼`, `ピザ`, `お食事`, `デザート`
];

@Injectable()
export class MenuService {

  menus: Menu[];
  dummyMenus: Menu[];
  selectedMenus: any[];

  constructor() {
    this.selectedMenus = [];
    this.menus         = []
    this.dummyMenus    = [
      {
        id: 1,
        name: `きゅうり一本漬`,
        type: `food`,
        category: 1,
        category_name: 'まずはコレっ！！',
        price: 310,
        price_in: 335,
        kcal: 24,
      },
      {
        id: 2,
        name: `なす一本漬`,
        type: `food`,
        category: 1,
        category_name: 'まずはコレっ！！',
        price: 310,
        price_in: 335,
        kcal: 49,
      },
      {
        id: 3,
        name: `枝豆`,
        type: `food`,
        category: 1,
        category_name: 'まずはコレっ！！',
        price: 290,
        price_in: 313,
        kcal: 142,
      },
      {
        id: 14,
        name: `チョレギサラダ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 421,
        kcal: 95,
      },
      {
        id: 15,
        name: `さっぱりレモンサラダ（塩麹ドレッシング）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 421,
        kcal: 195,
      },
      {
        id: 16,
        name: `具沢山シーザーサラダ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 480,
        price_in: 518,
        kcal: 219,
      },
      {
        id: 21,
        name: `まぐろ刺身`,
        type: `food`,
        category: 3,
        category_name: '刺身',
        price: 480,
        price_in: 518,
        kcal: 72,
      },
      {
        id: 22,
        name: `厳選〆さば`,
        type: `food`,
        category: 3,
        category_name: '刺身',
        price: 360,
        price_in: 389,
        kcal: 99,
      },
      {
        id: 23,
        name: `刺身三種盛り合せ`,
        type: `food`,
        category: 3,
        category_name: '刺身',
        price: 550,
        price_in: 594,
        kcal: 120,
      },
      {
        id: 27,
        name: `串焼盛り合せ`,
        type: `food`,
        category: 4,
        category_name: '串焼',
        price: 640,
        price_in: 691,
        kcal: 530,
      },
      {
        id: 28,
        name: `バラエティ盛り合せ`,
        type: `food`,
        category: 4,
        category_name: '串焼',
        price: 1450,
        price_in: 1560,
        kcal: 1144,
      },
      {
        id: 29,
        name: `ねぎ串（１本）`,
        type: `food`,
        category: 4,
        category_name: '串焼',
        price: 130,
        price_in: 140,
        kcal: 24,
      },
      {
        id: 53,
        name: `子持ちシシャモ`,
        type: `food`,
        category: 5,
        category_name: '焼物',
        price: 300,
        price_in: 324,
        kcal: 114,
      },
      {
        id: 54,
        name: `北海道産　真ほっけ`,
        type: `food`,
        category: 5,
        category_name: '焼物',
        price: 780,
        price_in: 842,
        kcal: 365,
      },
      {
        id: 55,
        name: `エイヒレ`,
        type: `food`,
        category: 5,
        category_name: '焼物',
        price: 360,
        price_in: 389,
        kcal: 172,
      },
      {
        id: 60,
        name: `ほうれん草ベーコン`,
        type: `food`,
        category: 6,
        category_name: '旨い物',
        price: 300,
        price_in: 324,
        kcal: 121,
      },
      {
        id: 61,
        name: `レバニラ炒め`,
        type: `food`,
        category: 6,
        category_name: '旨い物',
        price: 390,
        price_in: 421,
        kcal: 370,
      },
      {
        id: 62,
        name: `鉄板餃子`,
        type: `food`,
        category: 6,
        category_name: '旨い物',
        price: 340,
        price_in: 367,
        kcal: 288,
      },
      {
        id: 80,
        name: `ポテトフライ`,
        type: `food`,
        category: 7,
        category_name: '揚物',
        price: 330,
        price_in: 356,
        kcal: 330,
      },
      {
        id: 81,
        name: `鶏軟骨唐揚`,
        type: `food`,
        category: 7,
        category_name: '揚物',
        price: 330,
        price_in: 356,
        kcal: 168,
      },
      {
        id: 82,
        name: `みんなでおつまみ盛り`,
        type: `food`,
        category: 7,
        category_name: '揚物',
        price: 888,
        price_in: 959,
        kcal: 997,
      },
      {
        id: 92,
        name: `もちチー焼`,
        type: `food`,
        category: 8,
        category_name: '鉄板焼',
        price: 420,
        price_in: 454,
        kcal: 357,
      },
      {
        id: 93,
        name: `大盛りもやし炒め`,
        type: `food`,
        category: 8,
        category_name: '鉄板焼',
        price: 380,
        price_in: 410,
        kcal: 230,
      },
      {
        id: 94,
        name: `あらびきウインナー`,
        type: `food`,
        category: 8,
        category_name: '鉄板焼',
        price: 480,
        price_in: 518,
        kcal: 427,
      },
      {
        id: 100,
        name: `バジルピザ`,
        type: `food`,
        category: 9,
        category_name: 'ピザ',
        price: 380,
        price_in: 410,
        kcal: 315,
      },
      {
        id: 101,
        name: `ミックスピザ`,
        type: `food`,
        category: 9,
        category_name: 'ピザ',
        price: 680,
        price_in: 734,
        kcal: 699,
      },
      {
        id: 102,
        name: `ミックスピザ[ハーフ]`,
        type: `food`,
        category: 9,
        category_name: 'ピザ',
        price: 420,
        price_in: 454,
        kcal: 342,
      },
      {
        id: 108,
        name: `塩焼そば`,
        type: `food`,
        category: 10,
        category_name: 'お食事',
        price: 390,
        price_in: 421,
        kcal: 410,
      },
      {
        id: 109,
        name: `みそ汁`,
        type: `food`,
        category: 10,
        category_name: 'お食事',
        price: 50,
        price_in: 54,
        kcal: 40,
      },
      {
        id: 110,
        name: `キムチチャーハン`,
        type: `food`,
        category: 10,
        category_name: 'お食事',
        price: 420,
        price_in: 454,
        kcal: 452,
      },
      {
        id: 122,
        name: `アイスブリュレ`,
        type: `food`,
        category: 11,
        category_name: 'デザート',
        price: 320,
        price_in: 346,
        kcal: 194,
      },
      {
        id: 123,
        name: `アイスクリーム　ブルーベリーソース掛け`,
        type: `food`,
        category: 11,
        category_name: 'デザート',
        price: 150,
        price_in: 162,
        kcal: 59,
      },
      {
        id: 124,
        name: `アイスクレープ　マンゴーソース添え`,
        type: `food`,
        category: 11,
        category_name: 'デザート',
        price: 360,
        price_in: 389,
        kcal: 134,
      }
    ]
  }

  getMenus(): Observable<Menu[]> {
    return new Observable(observer => {
      setTimeout(() => {
        observer.next(this.menus);
      }, 1000);
    });
  }

  deleteMenu(menu: Menu): Menu[] {
    let filteredMenus = this.menus.filter((_menu) => _menu.id !== menu.id);
    return this.menus = filteredMenus;
  }

  askMenu(params: any): Promise<boolean> {
    console.log(params);
    return new Promise((resolve) => {
      this.menus = this.dummyMenus;
      setTimeout(() => {
        resolve(true);
      }, 3000);
    });
  }

  order(): Promise<boolean> {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(true);
      }, 3000);
    });
  }

}
