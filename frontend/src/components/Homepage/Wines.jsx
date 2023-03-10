import './wines.scss'
import {useHistory} from "react-router-dom";
import Star from "../../common/Star";
import { SlArrowLeft, SlArrowRight } from 'react-icons/sl'

const Wines = ({wines}) => {
    const history = useHistory();
    const pageMove = function (id) {
        history.push("/wine?wineId=" + id)
    }

    const leftMove = function () {
        document.querySelector(".slider-container").scrollBy({
            left: -1205,
            behavior: 'smooth'
        });
    }

    const rightMove = function () {
        document.querySelector(".slider-container").scrollBy({
            left: 1205,
            behavior: 'smooth'
        });
    }

    return (
        <div className="slider-container">
            {wines.map((wine) => {
                const randomNumber = (Math.random() * 2 + 3).toFixed(1);
                const rating = Math.floor((Math.random() * 1000).toFixed(1));
                const star = randomNumber * 20;

                return (
                    <div className="slider-item" onClick={() => pageMove(wine.id)} key={wine.id}>
                        <div>
                            <div className="slider-item-img">
                                <img src={wine.image} alt=""
                                />
                            </div>
                            <div className="slider-item-rating">
                                <span className="slider-item-rating-score">{randomNumber}</span><br/>
                                <span className="slider-item-rating-star">
                                    <Star point={star}/>
                                </span><br/>
                                <span className="slider-item-rating-count">{rating} ratings</span><br/><br/>
                                <span className="slider-item-rating-soldout">${wine.price}</span>
                                {/*<span className="slider-item-rating-but">buy</span>*/}
                            </div>
                        </div>
                        <div className="wine-info">
                            <p className="wine-company">{wine.winery}</p>
                            <p className="wine-name">{wine.name}</p>
                            <p className="wine-origin">{wine.region}</p>
                        </div>
                    </div>
                )
            })}
            <button className="prev-btn" onClick={leftMove}><SlArrowLeft /></button>
            <button className="next-btn" onClick={rightMove}><SlArrowRight /></button>
        </div>
    )
}

export default Wines