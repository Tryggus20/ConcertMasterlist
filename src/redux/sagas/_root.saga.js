import { takeEvery, put, call, all } from 'redux-saga/effects';
import concertSaga from './concert.saga';
import axios from "axios"


// rootSaga is the primary saga.
// It bundles up all of the other sagas so our project can use them.
// This is imported in index.js as rootSaga

// some sagas trigger other sagas, as an example
// the registration triggers a login
// and login triggers setting the user
export default function* rootSaga() {
  yield all([
    concertSaga(),
  ]);
}
