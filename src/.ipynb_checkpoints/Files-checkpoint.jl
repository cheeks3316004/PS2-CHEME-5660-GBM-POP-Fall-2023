# Internal method for load a CSV file 
function _loadcsvfile(path::String)::DataFrame
    return CSV.read(path, DataFrame);
end

function _jld2(path::String)::Dict{String,Any}
    return load(path);
end

# Load harded coded specific files -
function MyTreasuryBillDataSet()::DataFrame
    return _loadcsvfile(joinpath(_PATH_TO_DATA, "US-TBill-Prices-TD-May-Sept-2023.csv"));
end

function MyTreasuryNotesAndBondsDataSet()::DataFrame
    return _loadcsvfile(joinpath(_PATH_TO_DATA, "US-TNotesBonds-Prices-TD-May-Sept-2023.csv"));
end

function MyDailyTreasuryYieldCurveDataSet(;year::String = "2023")::DataFrame


    if (year == "2021")
        return _loadcsvfile(joinpath(_PATH_TO_DATA, "daily-treasury-rates-2021.csv"));
    elseif (year == "2022")
        return _loadcsvfile(joinpath(_PATH_TO_DATA, "daily-treasury-rates-2022.csv"));
    end

    # default to 2023 -
    return _loadcsvfile(joinpath(_PATH_TO_DATA, "daily-treasury-rates-2023.csv"));
end

MyPortfolioDataSet() = _jld2(joinpath(_PATH_TO_DATA, "SP500-Daily-OHLC-10-10-2023.jld2"));
MyFirmParametersDataSet() = _loadcsvfile(joinpath(_PATH_TO_DATA, "Parameters-SP500-2018-2022.csv"));