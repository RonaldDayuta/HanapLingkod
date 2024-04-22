$(document).ready(function(){
    // Function to handle change in main dropdown
    $('#mainDropdown').on("change", function() {
        var nestedDropdownContainer = $('#nestedDropdownContainer');
        if (this.value === 'nestedDropdown') {
            nestedDropdownContainer.show();
        } else {
            nestedDropdownContainer.hide();
            $('#sliderContainer').hide(); // Hide slider if nested dropdown is hidden
        }
    });

    // Function to handle change in nested dropdown
    $('#nestedDropdown').on("change", function() {
        var nestedValue = $(this).val();
        if (nestedValue === 'selectingItem') {
            $('#sliderContainer').show();
        } else {
            $('#sliderContainer').hide();
        }
    });

    // Slider change event handler
    $('#mySlider').on("input", function() {
        var sliderValue = $(this).val();
        console.log("Slider value: " + sliderValue);
        // Perform actions based on slider value
    });
});
