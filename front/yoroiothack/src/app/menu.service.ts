import {Observable} from "rxjs";
var request = require('superagent');

import { Injectable } from '@angular/core';
import {Http, Headers, RequestOptions} from "@angular/http";
import {Menu} from "./menu";

export const CATEGORY: string[] = [
  `まずはコレっ！！`, `サラダ`, `刺身`, `串焼`, `焼物`, `旨い物`,
  `揚物`, `鉄板焼`, `ピザ`, `お食事`, `デザート`
];

@Injectable()
export class MenuService {

  menus: Menu[];
  dummyMenus: Menu[];

  constructor(private http: Http) {
    this.menus         = [];
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
    // return new Promise((resolve) => {
    //   this.menus = this.dummyMenus;
    //   setTimeout(() => {
    //     resolve(true);
    //   }, 0);
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
