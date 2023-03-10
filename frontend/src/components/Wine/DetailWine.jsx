import React, {useEffect} from 'react';
import {useDispatch, useSelector} from "react-redux";
import "./DetailWine.scss"
import Star from "../../common/Star";
import WineTaste from "./WineTaste";
import WineReview from "./WineReview";
import {useLocation} from "react-router-dom";
import {addCart} from "../../utils/localStorageUtils"
import {fetchWine} from "../../store/winesReducer";
import {getWine} from "../../store/wine";
import {fetchRatingAllWineId, getRatingsByWineId} from "../../store/ratingReducer";

export default function DetailWine() {
    const dispatch = useDispatch();
    const location = useLocation();

    const searchParams = new URLSearchParams(location.search);
    const wineId = searchParams.get('wineId');

    let wine = useSelector(getWine(wineId))
    let ratings = useSelector(getRatingsByWineId)

    useEffect(() => {
        if (wineId) {
            dispatch(fetchWine(wineId))
        }
    }, [dispatch, wineId])

    useEffect(() => {
        if (wineId) {
            dispatch(fetchRatingAllWineId(wineId))
        }
    }, [dispatch, wineId]);

    const randomNumber = (Math.random() * 2 + 3).toFixed(1);
    const rating = Math.floor((Math.random() * 1000).toFixed(1));
    const star = randomNumber * 20;

    const addToCart = function () {
        addCart(wine);
        alert("Added to cart");
    }

    return (
    <div>
        {wine && (
        <>
            <div className={"wine-detail"}>
                <div className={"wine-detail-wrap"}>
                    <div>
                        <img className="image" onLoad="setImageSize(this)"
                             src={wine.image} height="500" width="114"
                             role="presentation"/>
                    </div>
                    <div className={"wine-detail-desc"}>
                        <h3 className={"company-name"}>{wine.winery}</h3>
                        <h1 className={"wine-name"}>{wine.name}</h1>
                        <span className={"wine-manufacturing-year"}>{wine.year}</span><br/>
                        <ul>
                            <li>{wine.country} </li>
                            <li>{wine.grape} </li>
                            <li>{wine.region} </li>
                            {/* <li>{wine.wine_type.charAt(0).toUpperCase() + wine.wine_type.slice(1)} </li> */}
                        </ul>

                        <div>
                            <div className={"rate-score"}>{randomNumber}</div>
                            <div className={"rate-score-desc"}>
                                <Star point={star} width={true}/>
                                <br/>
                                {rating} ratings
                            </div>
                        </div>

                        <br/>

                        <a className={"rate-add-wish"}>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-hidden="true" data-acsb-hidden="true" data-acsb-force-hidden="true"><path d="M18.75,21V4.8931A1.8423,1.8423,0,0,0,16.9752,3h-9.95A1.8423,1.8423,0,0,0,5.25,4.8931V21L12,15.6Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round" fill-rule="evenodd"></path></svg>
                            add to wishlist</a>
                    </div>
                    <div className={"price-box-wrapper"}>
                        <div className={"price-box"}>
                            <p className={"price-box-value"}>${wine.price}</p>
                            <span className={"price-box-value-desc"}>Average of all users-reported prices</span>
                            <hr className={"price-box-hr"}/><br/>
                            <button onClick={addToCart}>Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <WineTaste acidic={wine.acidic} bold={wine.bold} sweet={wine.sweet} tannic={wine.tannic} />
        </>
        )}
        {(ratings && wine) && (
            <WineReview wineId={wine.id} reviews={ratings}/>
        )}
    </div>
    )
}