import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store); Phase 1
  // addLoggingToDispatch(store);
  // store = applyMiddlewares(store, [addLoggingToDispatch]);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// Phase 1
// function addLoggingToDispatch(store) {
//   const storeDispatch = store.dispatch;
//   return function(action) {
//     console.log(store.getState());
//     console.log(action);
//     console.log(store.dispatch);
//     console.log(store.getState());
//   };
// }

// phase 2
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   store.dispatch(action);
//   console.log(store.getState());
// };
//
// const applyMiddlewares = (store, lom) => {
//   let dispatch = store.dispatch;
//   lom.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//     addLoggingToDispatch(store)(dispatch);
//   });
//   return Object.assign({}, store, {dispatch});
// };
