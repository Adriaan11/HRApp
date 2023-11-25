using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EngineeringClubHR.Classes.Client
{
    public class ClientService
    {
        private readonly ClientRepository _repository;
        public ClientService(ClientRepository repository)
        {
            _repository = repository;
        }
        public void SaveClient(EngineeringClubHR.Client client, bool isUpdate)
        {
            if (isUpdate)
            {
                _repository.UpdateClient(client);
            }
            else
            {
                _repository.AddClient(client);
            }
        }
    }
}