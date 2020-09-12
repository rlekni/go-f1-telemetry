package clients

import (
	"context"
	"os"

	"github.com/sirupsen/logrus"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type MongoClient struct {
	Client   *mongo.Client
	Database *mongo.Database
}

func NewMongoDBConnection(ctx context.Context) *MongoClient {
	connectionString := os.Getenv("MONGO_CONNECTION_STRING")
	clientOptions := options.Client().ApplyURI(connectionString)

	// Connect to MongoDB
	client, err := mongo.Connect(ctx, clientOptions)

	if err != nil {
		logrus.Fatal(err)
	}

	// Check the connection
	err = client.Ping(ctx, nil)

	if err != nil {
		logrus.Fatal(err)
	}

	logrus.Infoln("Connected to MongoDB!")

	return &MongoClient{
		Client: client,
	}
}

func (client MongoClient) Disconnect(ctx context.Context) {
	client.Client.Disconnect(ctx)
}

func (client MongoClient) GetDatabase(databaseName string) *mongo.Database {
	database := client.Client.Database(databaseName)
	client.Database = database
	return database
}

func (client MongoClient) GetCollection(collectionName string) *mongo.Collection {
	collection := client.Database.Collection(collectionName)
	return collection
}

func (client MongoClient) Insert(ctx context.Context, collectionName string, packet interface{}) {
	collection := client.GetCollection(collectionName)
	if collection == nil {
		logrus.Error("Collection has not been retrieved")
		return
	}

	result, err := collection.InsertOne(ctx, packet)
	if err != nil {
		logrus.Fatal(err)
	}

	logrus.Debugln("Inserted a single document: ", result.InsertedID)
}