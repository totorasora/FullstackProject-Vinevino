import { legacy_createStore, combineReducers, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import session from './session'
import winesReducer from "./winesReducer";
import ratingReducer from "./ratingReducer";

const rootReducer = combineReducers({
  session,
  wines: winesReducer,
  rating: ratingReducer
});

let enhancer;

if (process.env.NODE_ENV === 'production') {
  enhancer = applyMiddleware(thunk);
} else {
  const logger = require('redux-logger').default;
  const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState) => {
  return legacy_createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore;


