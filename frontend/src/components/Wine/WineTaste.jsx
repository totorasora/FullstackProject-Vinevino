import "./WineTaste.scss"
import React from "react";
import WineTasteGraph from "./WineTasteGraph";

export default function WineTaste({acidic, bold, sweet, tannic}) {
    return (
        <div className={"wine-taste"}>
            <div className={"wine-taste-content"}>
                <p>
                    What does this wine taste like?
                </p>
                <div className={"graph-bar-wrap"}>
                    <WineTasteGraph left={"Light"} right={"Bold"} point={bold} />
                    <WineTasteGraph left={"Smooth"} right={"Tannic"} point={tannic} />
                    <WineTasteGraph left={"Dry"} right={"Sweet"} point={sweet} />
                    <WineTasteGraph left={"Soft"} right={"Acidic"} point={acidic} />
                </div>
            </div>
        </div>
    )
}
