import {Observable} from "rxjs";
var request = require('superagent');

import { Injectable } from '@angular/core';
import {Http} from "@angular/http";
import {Menu} from "./menu";

export const CATEGORY: string[] = [
  `まずはコレっ！！`, `サラダ`, `刺身`, `串焼`, `焼物`, `旨い物`,
  `揚物`, `鉄板焼`, `ピザ`, `お食事`, `デザート`
];

@Injectable()
export class MenuService {

  menus: Menu[];
  //さっぱり
  dummyMenus: Menu[];
  //がっつり
  dummyMenus2: Menu[];
  //女子会
  dummyMenus3: Menu[];
  //おもしろ
  dummyMenus4: Menu[];


  constructor(private http: Http) {
    this.menus         = [];
    //さっぱりのイメージ
    this.dummyMenus    = [
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
        id: 123,
        name: `アイスクリーム　ブルーベリーソース掛け`,
        type: `food`,
        category: 11,
        category_name: 'デザート',
        price: 150,
        price_in: 162,
        kcal: 59,
      }
    ]
    //がっつり
    this.dummyMenus2    = [
      {
        id: 14,
        name: `ラーメンサラダ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 518,
        kcal: 95,
      },
      {
        id: 14,
        name: `ローストビーフピザ（こってり味）[ハーフ]`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 410,
        kcal: 95,
      },
      {
        id: 14,
        name: `ふわふわとろろ芋鉄板焼`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 454,
        kcal: 95,
      },
      {
        id: 14,
        name: `みんなでおつまみ盛り`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 959,
        kcal: 95,
      },
      {
        id: 14,
        name: `トンテキ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 529,
        kcal: 95,
      },
      {
        id: 14,
        name: `厚切りベーコン串（１本）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 162,
        kcal: 95,
      }
    ]
    //女子会
    this.dummyMenus3    = [
      {
        id: 14,
        name: `さっぱりレモンサラダ（塩麹ドレッシング）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 421,
        kcal: 95,
      },
      {
        id: 14,
        name: `刺身三種盛り合せ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 594,
        kcal: 95,
      },
      {
        id: 14,
        name: `ほうれん草ベーコン`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 324,
        kcal: 95,
      },
      {
        id: 14,
        name: `ふわふわとろろ芋鉄板焼`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 454,
        kcal: 95,
      },
      {
        id: 14,
        name: `バジルピザ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 410,
        kcal: 95,
      },
      {
        id: 14,
        name: `まぐろアボカド（塩麹マヨ）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 389,
        kcal: 95,
      },
      {
        id: 14,
        name: `ごろっとフルーツアイス添え`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 346,
        kcal: 95,
      }
    ]
    //おもしろ
    this.dummyMenus4    = [
      {
        id: 14,
        name: `おつまミミガー`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 302,
        kcal: 95,
      },
      {
        id: 14,
        name: `ごろごろサラダ（海老&アボカド&玉子）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 486,
        kcal: 95,
      },
      {
        id: 14,
        name: `真鯛刺身 ポン酢添え`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 518,
        kcal: 95,
      },
      {
        id: 14,
        name: `室蘭風焼とん串（１本）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 162,
        kcal: 95,
      },
      {
        id: 14,
        name: `ヤゲン串（１本）`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 194,
        kcal: 95,
      },
      {
        id: 14,
        name: `エイヒレ`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 389,
        kcal: 95,
      },
      {
        id: 14,
        name: `大盛りもやし炒め`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 410,
        kcal: 95,
      },
      {
        id: 14,
        name: `デザートピザ（北海道産あずき&クリーム）[ハーフ]`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 410,
        kcal: 95,
      },
      {
        id: 14,
        name: `冷奴`,
        type: `food`,
        category: 2,
        category_name: 'サラダ',
        price: 390,
        price_in: 302,
        kcal: 95,
      }
    ]

  }

  getMenus(): Observable<Menu[]> {
    return new Observable(observer => {
      setTimeout(() => {
        //デバッグ用
        this.menus = this.dummyMenus;
        //デバッグ用
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
      this.menus = this.dummyMenus2;
      setTimeout(() => {
        resolve(true);
      }, 0);
    });

    // const URL = `https://localhost/api`;
    // return this.http.post(URL, params)
    //   .toPromise()
    //   .then((response) => {
    //     this.menus = response.json().data as Menu[];
    //     return true;
    //   })
    //   .catch(this.handleError)
    // ;

    // let url = `https://localhost/api`;
    // return new Promise((resolve, reject) => {
    //   request.post(url)
    //     .send(params)
    //     .end(
    //       (err, res) => {
    //         if (err) {
    //           reject(err);
    //         } else {
    //           this.menus = JSON.parse(res);
    //           resolve(JSON.parse(res));
    //         }
    //       }
    //     );
    // });

    const headers: Headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    headers.append('Access-Control-Allow-Origin', '*');
    headers.append("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

    const options = new RequestOptions({
      headers: headers
    });

    const URL = `http://taptappun.cloudapp.net/recommend/imageine_json`;
    return this.http.get(URL, options)
      .toPromise()
      .then((response) => {
        console.log(response);
        this.menus = response.json().data as Menu[];
        return true;
      })
    ;
  }

  order(): Promise<boolean> {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(true);
      }, 3000);
    });
  }

  private handleError(error: any): Promise<boolean> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(false);
  }

}
