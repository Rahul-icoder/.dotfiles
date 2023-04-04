#! /bin/sh
function getDischargingIcon(){
    local percentageValue=`echo $1 | cut -d '%' -f 1`

    if (($percentageValue >= 0 && $percentageValue < 25 )); then
         echo "󰁻"
    fi
    
    if (($percentageValue >= 25 && $percentageValue < 50 )); then
         echo "󰁾"
    fi
    if (($percentageValue >= 50 && $percentageValue < 75 )); then
         echo "󰂀"
    fi
    if (($percentageValue >= 75 && $percentageValue < 100 )); then
         echo "󰁹"
    fi
    
}

function getBatteryInfo(){
    PERCENTAGE=`pmset -g batt | tail -n1 | awk '{print $3}' | cut -d ';' -f 1`
    ISBATTERYDISCHARGING=`pmset -g batt | tail -n1 | awk '{print $4}' | cut -d ';' -f 1`
    ICON=""
    case $ISBATTERYDISCHARGING in
        discharging)
            local returnIcon=$(getDischargingIcon $PERCENTAGE)
            ICON=$returnIcon    
            ;;
        charging)
            ICON="󰂄"
            ;;
        *)
            ICON=ISBATTERYDISCHARGING;;
    esac
    echo "$PERCENTAGE $ICON"
}

getBatteryInfo
