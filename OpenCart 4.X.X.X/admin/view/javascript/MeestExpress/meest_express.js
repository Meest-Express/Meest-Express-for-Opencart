// Meest Express Admin JavaScript
$(document).ready(function() {
    // Initialize tooltips
    $('[data-bs-toggle="tooltip"]').tooltip();
    
    // Handle form submission
    $('#form-shipping').on('submit', function(e) {
        e.preventDefault();
        
        var form = $(this);
        var url = form.attr('action');
        var data = form.serialize();
        
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            dataType: 'json',
            beforeSend: function() {
                $('.btn-primary').prop('disabled', true);
            },
            complete: function() {
                $('.btn-primary').prop('disabled', false);
            },
            success: function(json) {
                if (json['success']) {
                    location.reload();
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    
    // Handle import buttons
    $('[id^="button-import-"]').on('click', function() {
        var button = $(this);
        var action = button.attr('id').replace('button-import-', '');
        
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.import' + action.charAt(0).toUpperCase() + action.slice(1) + '&user_token=' + getURLParameter('user_token'),
            type: 'post',
            dataType: 'json',
            beforeSend: function() {
                button.prop('disabled', true).text('Loading...');
            },
            complete: function() {
                button.prop('disabled', false).text(button.data('original-text'));
            },
            success: function(json) {
                if (json['success']) {
                    alert(json['message']);
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
});

function getURLParameter(name) {
    return new URLSearchParams(window.location.search).get(name);
}

// Update regions function
function updateRegions() {
    var button = $('#button-update_region');
    
    $.ajax({
        url: 'index.php?route=extension/MeestExpress/shipping/meest_express.importRegions&user_token=' + getURLParameter('user_token'),
        type: 'post',
        dataType: 'json',
        beforeSend: function() {
            button.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Loading...');
        },
        complete: function() {
            button.prop('disabled', false).html('<i class="fas fa-sync-alt"></i> Refresh');
        },
        success: function(json) {
            if (json['success']) {
                alert(json['message']);
                location.reload();
            } else {
                alert(json['error']);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Update cities function
function updateCities() {
    var button = $('#button-update_city');
    
    $.ajax({
        url: 'index.php?route=extension/MeestExpress/shipping/meest_express.importCity&user_token=' + getURLParameter('user_token'),
        type: 'post',
        dataType: 'json',
        beforeSend: function() {
            button.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Loading...');
        },
        complete: function() {
            button.prop('disabled', false).html('<i class="fas fa-sync-alt"></i> Refresh');
        },
        success: function(json) {
            if (json['success']) {
                alert(json['message']);
                location.reload();
            } else {
                alert(json['error']);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Update branches function
function updateBranches() {
    var button = $('#button-update_branch');
    
    $.ajax({
        url: 'index.php?route=extension/MeestExpress/shipping/meest_express.importBranches&user_token=' + getURLParameter('user_token'),
        type: 'post',
        dataType: 'json',
        beforeSend: function() {
            button.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Loading...');
        },
        complete: function() {
            button.prop('disabled', false).html('<i class="fas fa-sync-alt"></i> Refresh');
        },
        success: function(json) {
            if (json['success']) {
                alert(json['message']);
                location.reload();
            } else {
                alert(json['error']);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Update streets function
function updateStreets() {
    var button = $('#button-update_street');
    
    $.ajax({
        url: 'index.php?route=extension/MeestExpress/shipping/meest_express.importStreets&user_token=' + getURLParameter('user_token'),
        type: 'post',
        dataType: 'json',
        beforeSend: function() {
            button.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Loading...');
        },
        complete: function() {
            button.prop('disabled', false).html('<i class="fas fa-sync-alt"></i> Refresh');
        },
        success: function(json) {
            if (json['success']) {
                alert(json['message']);
                location.reload();
            } else {
                alert(json['error']);
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

// Add contract function
function addContract() {
    var contractName = prompt('Enter contract name:');
    if (contractName) {
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.addContract&user_token=' + getURLParameter('user_token'),
            type: 'post',
            data: {name: contractName},
            dataType: 'json',
            success: function(json) {
                if (json['success']) {
                    alert('Contract added successfully');
                    location.reload();
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

// Delete contract function
function deleteContract(contractId) {
    if (confirm('Are you sure you want to delete this contract?')) {
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.deleteContract&user_token=' + getURLParameter('user_token'),
            type: 'post',
            data: {contract_id: contractId},
            dataType: 'json',
            success: function(json) {
                if (json['success']) {
                    alert('Contract deleted successfully');
                    location.reload();
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

// Add contact function
function addContact() {
    var contactName = prompt('Enter contact name:');
    if (contactName) {
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.addContact&user_token=' + getURLParameter('user_token'),
            type: 'post',
            data: {name: contactName},
            dataType: 'json',
            success: function(json) {
                if (json['success']) {
                    alert('Contact added successfully');
                    location.reload();
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

// Delete contact function
function deleteContact(contactId) {
    if (confirm('Are you sure you want to delete this contact?')) {
        $.ajax({
            url: 'index.php?route=extension/MeestExpress/shipping/meest_express.deleteContact&user_token=' + getURLParameter('user_token'),
            type: 'post',
            data: {contact_id: contactId},
            dataType: 'json',
            success: function(json) {
                if (json['success']) {
                    alert('Contact deleted successfully');
                    location.reload();
                } else {
                    alert(json['error']);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}
