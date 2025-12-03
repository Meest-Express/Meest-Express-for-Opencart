// Meest Express Catalog JavaScript
$(document).ready(function() {
    // Initialize shipping method selection
    $('.shipping-method input[type="radio"]').on('change', function() {
        if ($(this).val() === 'meest_express.meest_express') {
            // Handle Meest Express selection
        }
    });
    
    // Handle shipping quote request
    function getShippingQuote() {
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.quote',
            type: 'post',
            data: $('input[name^="shipping_"]:checked, input[name^="payment_"]:checked, input[name^="country_id"], input[name^="zone_id"], input[name^="postcode"], input[name^="city"]'),
            dataType: 'json',
            beforeSend: function() {
                var $button = $('#button-shipping-method');
                $button.prop('disabled', true);
                var originalText = $button.html();
                $button.data('original-text', originalText);
                $button.html('<i class="fa fa-spinner fa-spin"></i> Loading...');
            },
            complete: function() {
                var $button = $('#button-shipping-method');
                $button.prop('disabled', false);
                var originalText = $button.data('original-text');
                if (originalText) {
                    $button.html(originalText);
                }
            },
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                } else {
                    // Update shipping methods
                    if (json['shipping_method']) {
                        // Handle shipping method update
                    }
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
    
    // Trigger quote request on address change
    $('input[name="country_id"], input[name="zone_id"], input[name="postcode"], input[name="city"]').on('change', function() {
        getShippingQuote();
    });
});
