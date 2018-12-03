App = {
    web3Provider: new Web3(new Web3.providers.HttpProvider("https://testnet-rpc.gochain.io")),
    contracts: {},
    account: '0x0',
  
    init: function() {
      return App.initWeb3();
    },
  
    initWeb3: function() {
      if (typeof web3 !== 'undefined') {
        // If a web3 instance is already provided by Meta Mask.
        App.web3Provider = web3.currentProvider;
        web3 = new Web3(web3.currentProvider);
      } else {
        // Specify default instance if no web3 instance provided
        App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        web3 = new Web3(App.web3Provider);
      }
      return App.initContract();
    },
  
    initContract: function() {
        $('#btnSubmit').bind("click",function(event){
        // initialize variables
            var contractName = $("#cxt_name").val();
            var ownerAddress = $("#owner").val();
        
        $.getJSON("Factory.json", function(createChildContract) {
            // Instantiate a new truffle contract from the artifact
            App.contracts.Factory = TruffleContract(Factory);
            // Connect provider to interact with contract
            App.contracts.Factory.setProvider(App.web3Provider);
  
            return App.render();
        });
    });
    },  
  
    render: function() {
      var newContractInstance;
      var loader = $("#loader");
      var content = $("#content");
  
      loader.show();
      content.hide();
  
      // Load account data
      web3.eth.getCoinbase(function(err, account) {
        if (err === null) {
          App.account = account;
          $("#accountAddress").html("Your Account: " + account);
        }
      });
      
      
      // Load contract data
      App.contracts.Raisee.deployed().then(function(instance) {
        raiseeInstance = instance;
        return raiseeInstance.Contracts();
      }).then(function() {
        var contractResults = $("#contractResults");
        contractResults.empty();
  
        for (var i = 1; i <= 3; i++) {
          raiseeInstance.Contracts(i).then(function(contract) {
            var ctOwner = $("#cxt_name").val;
            var ctName = $("#ctowner").val;
            var username = $("#username").val;
  
            // Render candidate Result
            var contractTemplate = "<tr><th>" + cxt_name + "</th><td>" + ctowner + "</td><td>" + username + "</td></tr>"
            contractResults.append(contractTemplate);
          });
        }
  
        loader.hide();
        content.show();
      }).catch(function(error) {
        console.warn(error);
      });
    }
  };
  
  $(function() {
    $(window).load(function() {
      App.init();
    });
  });